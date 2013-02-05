/*
 * Author: Chia Chang
 * Developer: Chia Chang
 * Copyright: Author for details.
 * Title: JS Mobile Library for Order-2-Cash 
 * Description:
 * Mobile Development for Order-2-Cash.
 * To self-improving, do NOT copy-paste people's work. 
 * Creative is the key to the real engineering world.
 * Thinking javascript is just nothing?! Well, you better think it again.
 * Ref#: 3.1, MIT version.
 * Licensing: Mitchell International. GPL is available in Git format via SVN. Ask Chia for details.
 * Open Issues (remove when resolved): N/A
 * Usage: See Chrome Developer tools or Firebug for Firefox or IE Developer Console.
 * API Version: jQuery Mobile library 1.2.0, update is required.
 * Revisions' History:
 * 02-02-2013: Library Created by Chia
 */

$j = jQuery;
$j.noConflict();

/* Chia's Mobile Tool Lib */
var app = {
	ver: 'miCon Mobile 0.1.0b',
	blockObj: function(){return $j('#formBlock');},
	packageMatrix: '',
	getURLStr:
		function(param) {
		    var val = document.URL;
		    var url = val.substr(val.indexOf(param))  
		    var n=url.replace(param+"=","");
		    return n; 
		},
	init: function(){
		  	
		  	$j('#title').text(app.ver);
		  	$j('#footMark').text('Project O2C Mobile 2013');

		  	var obj=app.oppInfo[0];
		  	//var infoStr='<ul data-role=\'listview\' class=\'pView\'><li>Opportunity Name: <a href=\'/' + obj.oppId + '\' style=\'text-decoration: underline;\'>' + obj.oppName + '</a></li>' +
			//				'<li>Account Name: <a href=\'/' + obj.accId + '\' style=\'text-decoration: underline;\'>' + obj.accName + '</a></li>' +
			//				'<li>License: ' + obj.licenseNum + ' ' + obj.licenseUnit + '</li>' +
			//				'<li>Contract Term: ' + obj.contractTerm + '</li></ul>';
		  	var infoStr='<div class=\'ui-grid-a\'>' +
						'<div class=\'ui-block-a\' style=\'font-size: 0.8em;font-weight: bold;\'>Opportunity Name: <a rel=external href=\'/' + obj.oppId + '\' style=\'text-decoration: underline;\'>' + obj.oppName + '</a></font></div>' +
						'<div class=\'ui-block-b\' style=\'font-size: 0.8em;font-weight: bold;\'>Account Name: <a rel=external href=\'/' + obj.accId + '\' style=\'text-decoration: underline;\'>' + obj.accName + '</a></div>' +
						'<div class=\'ui-block-c\' style=\'font-size: 0.8em;font-weight: bold;\'>License: ' + obj.licenseNum + ' ' + obj.licenseUnit + '</div>' +
						'<div class=\'ui-block-d\' style=\'font-size: 0.8em;font-weight: bold;\'>Contract Term: ' + obj.contractTerm + '</div>' +
						'</div>';
						
		  	$j('#informationCentre').append($j('<div/>',{'id':'iContent','data-role':'collapsible','data-theme':'b','data-content-theme':'b'})
										.append($j('<h2/>').text('Information Centre'))
										.append($j(infoStr)));
										//.append($j('<p/>').append(infoStr)));
										
			
			var opList=$j('#packageClassList');
			for (px in app.packageMatrix){
				var str='';
				for (qx in app.packageMatrix[px]){
					str+='<li><a href="#">' + app.packageMatrix[px][qx].productName + '</a></li>';
				}
				var str=$j('<div/>',{'data-role':'collapsible','data-theme':'b'})
						.append($j('<h2/>').text(px))
						.append($j('<div/>').append($j('<ul/>',{'class':'pView','data-role':'listview',
															 'data-inset':'true','data-filter':'true',
															 'data-filter-theme':'c','data-divider-theme':'d'})
															 	.append(str)
												   )	
										
						)
				opList.append(str);
			}
			$j('.pView').each(function(){$j(this).listview();});
			//$j('.pView').each(function(){$j(this).listview('refresh');});
			$j('#informationCentre').collapsibleset( "refresh" )
			$j('#iContent').trigger( "expand" );
			//$( ".selector" );
			opList.collapsibleset( "refresh" );
		 },
	oppInfo: [] 
}

$j(document).ready(function(){
	app.init();
});

