package com.ibm.automation.domain;

/**
 * 备份记录实体类
 * @author HeGe
 *
 */

public class Tsminfo {
    private Integer tsmId;

    private String businessType;

    private String ip;

    private String backupType;

    private String dbName;

    private String dbVersion;

    public Integer getTsmId() {
        return tsmId;
    }

    public void setTsmId(Integer tsmId) {
        this.tsmId = tsmId;
    }

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType == null ? null : businessType.trim();
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public String getBackupType() {
        return backupType;
    }

    public void setBackupType(String backupType) {
        this.backupType = backupType == null ? null : backupType.trim();
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName == null ? null : dbName.trim();
    }

    public String getDbVersion() {
        return dbVersion;
    }

    public void setDbVersion(String dbVersion) {
        this.dbVersion = dbVersion == null ? null : dbVersion.trim();
    }
}