package com.ibm.automation.domain;

public class DagInfoBean {
    private String dagId;

    private String dagAlias;

    private String dagHispage;

    private String dagRunpage;

    private Integer dagStatus;

    private String dagRefresh;

    private Integer dagOrder;

    public String getDagId() {
        return dagId;
    }

    public void setDagId(String dagId) {
        this.dagId = dagId == null ? null : dagId.trim();
    }

    public String getDagAlias() {
        return dagAlias;
    }

    public void setDagAlias(String dagAlias) {
        this.dagAlias = dagAlias == null ? null : dagAlias.trim();
    }

    public String getDagHispage() {
        return dagHispage;
    }

    public void setDagHispage(String dagHispage) {
        this.dagHispage = dagHispage == null ? null : dagHispage.trim();
    }

    public String getDagRunpage() {
        return dagRunpage;
    }

    public void setDagRunpage(String dagRunpage) {
        this.dagRunpage = dagRunpage == null ? null : dagRunpage.trim();
    }

    public Integer getDagStatus() {
        return dagStatus;
    }

    public void setDagStatus(Integer dagStatus) {
        this.dagStatus = dagStatus;
    }

    public String getDagRefresh() {
        return dagRefresh;
    }

    public void setDagRefresh(String dagRefresh) {
        this.dagRefresh = dagRefresh == null ? null : dagRefresh.trim();
    }

    public Integer getDagOrder() {
        return dagOrder;
    }

    public void setDagOrder(Integer dagOrder) {
        this.dagOrder = dagOrder;
    }
}