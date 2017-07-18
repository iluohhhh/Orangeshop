package com.orange.bean.product;

import com.orange.bean.PageBean;

import java.io.Serializable;

/**
 * 商品类型
 */
public class Type extends PageBean implements Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String name;
	private Integer parentId;
	private String note;
	private Integer isDisplay;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Integer getIsDisplay() {
		return isDisplay;
	}
	public void setIsDisplay(Integer isDisplay) {
		this.isDisplay = isDisplay;
	}
	public String toString() {
		return "Type [id=" + id + ",name=" + name + ",parentId=" + parentId + ",note=" + note + ",isDisplay=" + isDisplay + "]";
	}
}
