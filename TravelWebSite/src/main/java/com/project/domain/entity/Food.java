package com.project.domain.entity;

import java.io.Serializable;




import java.util.Date;

import javax.persistence.*;


/**
 * The persistent class for the t_foods database table.
 * 
 */
@Entity
@Table(name="t_foods")
@NamedQuery(name="Food.findAll", query="SELECT f FROM Food f")
public class Food implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;

	@Column(name="ADDRESS_ID")
	private Long addressId;

	private String code;

	@Column(name="COMMENT_TIMES")
	private int commentTimes;

	@Column(name="GOOD_TIMES")
	private int goodTimes;
	
	@Column(name="TYPE")
	private String type;//美食类型

	@Column(name="PRICE")
	private String price;
	
	@Column(name="ADDRESS_NAME")
	private String addressName;
	
	private String infomation;

	private String name;

	private String status;
	
	@Column(name="REASON")
	private String reason;
	
	@Column(name="URL")
	private String url;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_DATE")
	private Date createDate;
	
	@Column(name="CREATE_ID")
	private Long createId;
	
	

	public Long getCreateId() {
		return createId;
	}

	public void setCreateId(Long createId) {
		this.createId = createId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Food() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Long getAddressId() {
		return this.addressId;
	}

	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getCommentTimes() {
		return this.commentTimes;
	}

	public void setCommentTimes(int commentTimes) {
		this.commentTimes = commentTimes;
	}

	public int getGoodTimes() {
		return this.goodTimes;
	}

	public void setGoodTimes(int goodTimes) {
		this.goodTimes = goodTimes;
	}

	public String getInfomation() {
		return this.infomation;
	}

	public void setInfomation(String infomation) {
		this.infomation = infomation;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
}