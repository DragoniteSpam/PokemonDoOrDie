/// DataEventNode event_create_node(Event, name, EventNodeType);

var node=instance_create(0, 0, DataEventNode);
node.event=argument[0];
node.name=argument[1];
node.type=argument[2];

ds_list_add(argument[0].nodes, node);

return node;
