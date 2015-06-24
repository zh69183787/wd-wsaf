//条线管理员配置
$.getLineHead=function(){
	var lineHead="[";
	lineHead+="{'mainType':'party','loginName':'G001000000152502','name':'吴昕毅'},";
	lineHead+="{'mainType':'admin','loginName':'G001000001642510','name':'黄刚'},";
	lineHead+="{'mainType':'union','loginName':'G010070003442503','name':'严婵琳'},";
	lineHead+="{'mainType':'youthLeague','loginName':'G010050007772504','name':'卢思杰'},";
	lineHead+="{'mainType':'discipline','loginName':'G001000000942505','name':'徐卫平'}]";
	var json=eval('('+lineHead+')');
	return json;
}

$.getQteMainType=function(){
	var deptTypes="[";
//	//胡波是2549
//	deptTypes+="{'deptId':'2549','type':'party','line':'G002000000332549'},";
	
	deptTypes+="{'deptId':'2502','type':'party','line':'G001000000152502'},";
	deptTypes+="{'deptId':'2510','type':'admin','line':'G001000001642510'},";
	deptTypes+="{'deptId':'2503','type':'union','line':'G010070003442503'},";
	deptTypes+="{'deptId':'2504','type':'youthLeague','line':'G010050007772504'},";
	deptTypes+="{'deptId':'2905','type':'discipline','line':'G001000000942505'}]";
	var json=eval('('+deptTypes+')');
	return json;
}


$.getActThemeDeptType=function(){
	var deptTypes="[";
//	//胡波是2549
//	deptTypes+="{'deptId':'2549','type':'partyCategory,manageCategory,specialCategory'},";
	
	deptTypes+="{'deptId':'2502','type':'partyCategory,specialCategory'},";
	deptTypes+="{'deptId':'2503','type':'partyCategory,specialCategory'},";
	deptTypes+="{'deptId':'2504','type':'partyCategory,specialCategory'},";
	deptTypes+="{'deptId':'2510','type':'manageCategory,specialCategory'},";
	deptTypes+="{'deptId':'2941','type':'specialCategory,specialCategory'}]";
	var json=eval('('+deptTypes+')');
	return json;
}


$.getCptComplaintDeptType=function(){
	var deptTypes="[";
//	//胡波是2549
//	deptTypes+="{'deptId':'2549','type':'massWork'},";
	deptTypes+="{'deptId':'2502','type':'massWork'},";
	deptTypes+="{'deptId':'2510','type':'admimBusiness'},";
	deptTypes+="{'deptId':'2505','type':'disciplineSupervise'}]";
	var json=eval('('+deptTypes+')');
	return json;
}