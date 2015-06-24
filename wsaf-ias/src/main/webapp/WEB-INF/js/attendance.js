var days = { //考勤日对象
	//传入年\月获取该月的考勤天\以数组返回
	get : function(y, m) {
		y = parseInt(y,10);
		m = parseInt(m,10);

		m -= 1;
		if(m == 0){
			m = 12;
			y -= 1;
		}
		
		var num = this.month[m] + (m == 2 && ((y % 4 == 0 && y % 100 != 0) || (y % 400 == 0)) ? 1: 0);
		var d = [];
		for (var i = 26; i <= num; i++) {
			d.push(i + "");
		}
		for (var i = 1; i <= 25; i++) {
			d.push((i < 10 ? "0" : "") + i);
		}
		return d;
	},
	//传入年月日判断是否为周末(公假)
	isWeekend : function(y, m, d) {
		y = parseInt(y,10);
		m = parseInt(m,10);
		d = parseInt(d,10);

		var w = new Date(y, m - 1, d).getDay();

		return w == 6 || w == 0;
	},
	//月份对应天数的参数
	month : {
		1 : 31,
		2 : 28,
		3 : 31,
		4 : 30,
		5 : 31,
		6 : 30,
		7 : 31,
		8 : 31,
		9 : 30,
		10 : 31,
		11 : 30,
		12 : 31
	}
}

function getNowYm() {
	var d = new Date();
	var y = d.getFullYear();
	var m = d.getMonth() + 1;
	if (m < 10) {
		m = "0" + m;
	}
	return y + "-" + m;
}
//判断查询是否成功
function chkRtn(d) {
	return d
			&& d.success
			&& (d.result instanceof Array ? d.result.length > 0 : !$.isEmptyObject(d.result));
}


function getRealYmd(y,m,d){
	m = parseInt(m,10) - (parseInt(d,10) >= 26 ? 1 : 0);
	if(m == 0 ){
		m = 12;
		y = parseInt(y,10) - 1;
	}
	m = (m < 10 ? "0" : "") + m;
	d = d + "";
	
	return [y,m,d];
}


function getKey(id,y,m,d){
	var rymd = getRealYmd(y, m, d);
	return id + "-" + rymd[0] +"-" + rymd[1] + "-" + rymd[2];
}
