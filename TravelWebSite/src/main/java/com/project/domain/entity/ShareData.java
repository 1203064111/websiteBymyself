package com.project.domain.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity  
@Table (name="SHARE_DATA")
public class ShareData {
	@Id  
    @GeneratedValue 
    @Column(name = "ID")  
    private int id;  
	@Column(name="SHARE_TYPE")
    private String shareType;  
	@Column(name="SHARE_CODE")
    private String shareCode; 
	@Column(name="SHARE_NAME")
    private String shareName;  
    public int getId() {  
        return id;  
    }  
    public void setId(int id) {  
        this.id = id;  
    }  
    public String getShareType() {  
        return shareType;  
    }  
    public void setShareType(String shareType) {  
        this.shareType = shareType;  
    }  
    public String getShareCode() {  
        return shareCode;  
    }  
    public void setShareCode(String shareCode) {  
        this.shareCode = shareCode;  
    }  
    public String getShareName() {  
        return shareName;  
    }  
    public void setShareName(String shareName) {  
        this.shareName = shareName;  
    }  
}
