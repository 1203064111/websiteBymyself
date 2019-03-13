package com.project.domain.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;


/**
 * The persistent class for the t_address database table.
 * 
 */
@Entity
@Table(name="t_address")
@NamedQuery(name="Address.findAll", query="SELECT a FROM Address a")
public class Address implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;

	private String code;

	@Column(name="COMMENT_TIMES")
	private int commentTimes;

	@Column(name="FOODS_ID")
	private Long foodsId;

	@Column(name="GOOD_TIMES")
	private int goodTimes;
	
	@Column(name="TYPE")
	private String type;//景点类型
	
	@Column(name="PRICE")
	private String price;
	
	@Column(name="FOODS_NAME")
	private String foodsName;

	private String information;

	private String name;
	
	@Column(name="URL")
	private String url;

	private String status;
	
	@Column(name="REASON")
	private String reason;
	
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

	public Address() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
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

	public Long getFoodsId() {
		return this.foodsId;
	}

	public void setFoodsId(Long foodsId) {
		this.foodsId = foodsId;
	}

	public int getGoodTimes() {
		return this.goodTimes;
	}

	public void setGoodTimes(int goodTimes) {
		this.goodTimes = goodTimes;
	}

	public String getInformation() {
		return this.information;
	}

	public void setInformation(String information) {
		this.information = information;
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

	public String getFoodsName() {
		return foodsName;
	}

	public void setFoodsName(String foodsName) {
		this.foodsName = foodsName;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	
	
}