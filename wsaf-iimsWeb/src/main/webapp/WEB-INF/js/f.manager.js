;(function($, window, document,undefined) { 
	
	function addNodes(dtnode, level1, level2, level3, forceUpdate) {
	    if( forceUpdate != true )
	        dtnode.tree.enableUpdate(false);
	    
	    var key;
	    for (var i=0; i<level1; i++) {
	        key = "" + (i+1);
	        var f = dtnode.addChild({title: "Folder_" + key,
	                               key: key,
	                               isFolder: true
	                               });
	        for (var j=0; j<level2; j++) {
	            key = "" + (i+1) + "." + (j+1);
	            var d = f.addChild({title: "Node_" + key,
	                              key: key
	                              });
	            for (var k=0; k<level3; k++) {
	                key = "" + (i+1) + "." + (j+1) + "." + (k+1);
	                d.addChild({title: "Node_" + key,
	                          key: key
	                          });
	            }
	        }
	    }
	    dtnode.tree.enableUpdate(true);
	}
	
})(jQuery, window, document);