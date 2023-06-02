package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class Minsu {
    /*民宿id*/
    private Integer minsuId;
    public Integer getMinsuId(){
        return minsuId;
    }
    public void setMinsuId(Integer minsuId){
        this.minsuId = minsuId;
    }

    /*所在地区*/
    private Area areaObj;
    public Area getAreaObj() {
        return areaObj;
    }
    public void setAreaObj(Area areaObj) {
        this.areaObj = areaObj;
    }

    /*民宿名称*/
    @NotEmpty(message="民宿名称不能为空")
    private String minsuName;
    public String getMinsuName() {
        return minsuName;
    }
    public void setMinsuName(String minsuName) {
        this.minsuName = minsuName;
    }

    /*民宿照片*/
    private String minsuPhoto;
    public String getMinsuPhoto() {
        return minsuPhoto;
    }
    public void setMinsuPhoto(String minsuPhoto) {
        this.minsuPhoto = minsuPhoto;
    }

    /*每日价格*/
    @NotNull(message="必须输入每日价格")
    private Float price;
    public Float getPrice() {
        return price;
    }
    public void setPrice(Float price) {
        this.price = price;
    }

    /*民宿介绍*/
    @NotEmpty(message="民宿介绍不能为空")
    private String minsuDesc;
    public String getMinsuDesc() {
        return minsuDesc;
    }
    public void setMinsuDesc(String minsuDesc) {
        this.minsuDesc = minsuDesc;
    }

    /*备注信息*/
    private String minsuMemo;
    public String getMinsuMemo() {
        return minsuMemo;
    }
    public void setMinsuMemo(String minsuMemo) {
        this.minsuMemo = minsuMemo;
    }

    /*民宿主人*/
    private Owner ownerObj;
    public Owner getOwnerObj() {
        return ownerObj;
    }
    public void setOwnerObj(Owner ownerObj) {
        this.ownerObj = ownerObj;
    }

    /*发布时间*/
    @NotEmpty(message="发布时间不能为空")
    private String addTime;
    public String getAddTime() {
        return addTime;
    }
    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonMinsu=new JSONObject(); 
		jsonMinsu.accumulate("minsuId", this.getMinsuId());
		jsonMinsu.accumulate("areaObj", this.getAreaObj().getAreanName());
		jsonMinsu.accumulate("areaObjPri", this.getAreaObj().getAreaId());
		jsonMinsu.accumulate("minsuName", this.getMinsuName());
		jsonMinsu.accumulate("minsuPhoto", this.getMinsuPhoto());
		jsonMinsu.accumulate("price", this.getPrice());
		jsonMinsu.accumulate("minsuDesc", this.getMinsuDesc());
		jsonMinsu.accumulate("minsuMemo", this.getMinsuMemo());
		jsonMinsu.accumulate("ownerObj", this.getOwnerObj().getName());
		jsonMinsu.accumulate("ownerObjPri", this.getOwnerObj().getOwnerUserName());
		jsonMinsu.accumulate("addTime", this.getAddTime().length()>19?this.getAddTime().substring(0,19):this.getAddTime());
		return jsonMinsu;
    }}