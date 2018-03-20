/** 用于配置playbook相关的参数  **/

function playbook_property(){  
	 this.ftp_user="itoa";  
	 this.ftp_password="itoa"; 
	 this.tsm_path="/tsm_path";
	 this.downloadpath="/tmp/tsmclient";
	 this.ftp_server="/ftp_server";
	 this.softpath="/home/data/software/";			//软件介质路径
	 this.serverip="192.168.80.154",
	 this.serverport="8000",
	 this.runapi="/api/v1/run",
	 this.getTsmclientVersionapi="/api/v1/fp",
	 this.getTsmInstallFileNameapi="/api/v1/"
};   
playbook_property.prototype.get=function(param){ 
	 return this[param];  
};;  
