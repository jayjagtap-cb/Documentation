Important Documentation on how to use in python
```
https://github.com/Cerebras/monolith/tree/670e5c3c5763507dacf59db9d8ec2ff93a335655/src/das
```

Sample Code
```
import cerebras.das.daspybind as daspybind
das = daspybind.DasContext("plan.meta")
kgs = das.get_kernel_graph_service()
print(kgs.nodes())
```
Sample Output
```
['AutoGen1', 'AutoGen2', 'AutoGen3', 'AutoGen4', 'AutoGen5', 'add1', 'add2', 'add3', 'broadcast',
'broadcast1', 'broadcast2', 'broadcast3', 'broadcast4', 'broadcast5', 'broadcast6', 'buf.AutoGen4.in_0', 
'buf.AutoGen5.in_0', 'buf.add1.rxdelta1', 'buf.broadcast.rxact', 'buf.broadcast1.rxact', 'buf.broadcast4.rxact',
'buf.broadcast5.rxact', 'buf.elementwise2.rxdelta2', 'buf.elementwise3.rxdelta1', 'buf.elementwise3.rxdelta2', 
'buf.elementwise4.rxdelta2', 'buf.elementwise5.rxdelta2', 'buf.elementwise6.rxdelta2', 'buf.embedding1.rxact', 
'buf.embedding1.rxact2', 'buf.ewpb.rxact', 'buf.fc_para1.rxact2', 'buf.fc_para2.rxact2', 'buf.fc_para3.rxact2', 
'buf.fc_para4.rxact2', 'buf.layer_norm1.rxact2', 'buf.layer_norm2.rxact2', 'buf.mul1.rxdelta2', 'buf.nlin2.rxact2', 
'buf.outer_product1.rxact', 'buf.pack.rx1', 'buf.reduce2.rxact', 'buf.reduce3.rxact', 'buf.reshape_inner.unpack.tx2.rx', 
'buf.scatter1.rxidx', 'buf.scatter2.rxidx', 'buf.softmax_xentr1.rxlabel', 'buf.unpack.rxdata', 'buf.unsorted_gather1.rxidx', 
'buf.unsorted_gather2.rxidx', 'buf.weights1.rxact', 'buf.weights1.rxact2', 'elementwise', 'elementwise1', 'elementwise2', 
'elementwise3', 'elementwise4', 'elementwise5', 'elementwise6', 'embedding1', 'ewpb', 'ewpb1', 'fc_para1', 'fc_para2', 'fc_para3', 
'fc_para4', 'gen', 'layer_norm1', 'layer_norm2', 'model_0_drain0', 'model_0_drain1', 'mul1', 'nlin1', 'nlin2', 'outer_product1', 'pack', 
'patio', 'reduce1', 'reduce2', 'reduce3', 'reshape', 'reshape_inner.unpack.tx0', 'reshape_inner.unpack.tx1', 'reshape_inner.unpack.tx2', 
'reshape_inner.unpack.tx7', 'scatter1', 'scatter2', 'softmax_xentr1', 'unpack', 'unsorted_gather1', 'unsorted_gather2', 'weights1']
```
