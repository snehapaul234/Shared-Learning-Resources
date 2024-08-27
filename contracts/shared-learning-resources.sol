// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LearningResourceSharing {
    
    // Structure to hold resource information
    struct Resource {
        string title;
        string description;
        string url;
        address owner;
    }

    // Mapping to store resources based on an ID
    mapping(uint => Resource) public resources;
    
    // Array to keep track of resource IDs
    uint[] public resourceIds;
    
    // Event to be emitted when a new resource is added
    event ResourceAdded(uint resourceId, string title, address owner);

    // Modifier to check if the sender is the owner of the resource
    modifier onlyOwner(uint resourceId) {
        require(resources[resourceId].owner == msg.sender, "Not the owner");
        _;
    }

    // Function to add a new resource
    function addResource(string memory _title, string memory _description, string memory _url) public {
        uint resourceId = resourceIds.length + 1; // Generate new ID
        resources[resourceId] = Resource(_title, _description, _url, msg.sender);
        resourceIds.push(resourceId);

        emit ResourceAdded(resourceId, _title, msg.sender);
    }

    // Function to view a resource by ID
    function getResource(uint _resourceId) public view returns (string memory, string memory, string memory, address) {
        Resource memory res = resources[_resourceId];
        return (res.title, res.description, res.url, res.owner);
    }

    // Function to share a resource with another institution (could be implemented in various ways)
    function shareResource(uint _resourceId, address _recipient) public onlyOwner(_resourceId) {
        // Implement your sharing logic here (e.g., granting access, notifying recipient, etc.)
    }
    
    // Function to get the total number of resources
    function getTotalResources() public view returns (uint) {
        return resourceIds.length;
    }
}
