package com.ibm.automation.domain;

import java.util.Date;

public class DagBean {
    private String dagId;

    private Boolean isPaused;

    private Boolean isSubdag;

    private Boolean isActive;

    private Date lastSchedulerRun;

    private Date lastPickled;

    private Date lastExpired;

    private Boolean schedulerLock;

    private Integer pickleId;

    private String fileloc;

    private String owners;

    public String getDagId() {
        return dagId;
    }

    public void setDagId(String dagId) {
        this.dagId = dagId == null ? null : dagId.trim();
    }

    public Boolean getIsPaused() {
        return isPaused;
    }

    public void setIsPaused(Boolean isPaused) {
        this.isPaused = isPaused;
    }

    public Boolean getIsSubdag() {
        return isSubdag;
    }

    public void setIsSubdag(Boolean isSubdag) {
        this.isSubdag = isSubdag;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public Date getLastSchedulerRun() {
        return lastSchedulerRun;
    }

    public void setLastSchedulerRun(Date lastSchedulerRun) {
        this.lastSchedulerRun = lastSchedulerRun;
    }

    public Date getLastPickled() {
        return lastPickled;
    }

    public void setLastPickled(Date lastPickled) {
        this.lastPickled = lastPickled;
    }

    public Date getLastExpired() {
        return lastExpired;
    }

    public void setLastExpired(Date lastExpired) {
        this.lastExpired = lastExpired;
    }

    public Boolean getSchedulerLock() {
        return schedulerLock;
    }

    public void setSchedulerLock(Boolean schedulerLock) {
        this.schedulerLock = schedulerLock;
    }

    public Integer getPickleId() {
        return pickleId;
    }

    public void setPickleId(Integer pickleId) {
        this.pickleId = pickleId;
    }

    public String getFileloc() {
        return fileloc;
    }

    public void setFileloc(String fileloc) {
        this.fileloc = fileloc == null ? null : fileloc.trim();
    }

    public String getOwners() {
        return owners;
    }

    public void setOwners(String owners) {
        this.owners = owners == null ? null : owners.trim();
    }
}