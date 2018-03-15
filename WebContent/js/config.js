/** 用于配置playbook相关的参数  **/

function playbook_property(){  
	 this.ftp_user="itoa";  
	 this.ftp_password="itoa"; 
	 this.tsm_path="/tsm_path";
	 this.downloadpath="/tmp/tsmclient";
	 this.ftp_server="/ftp_server";
};   
playbook_property.prototype.get=function(param){ 
	 return this[param];  
};;  
