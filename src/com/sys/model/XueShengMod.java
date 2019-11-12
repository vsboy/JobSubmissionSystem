package com.sys.model;

public class XueShengMod {
    private int stuid;
    private String stuname;
    
    @Override
    public String toString() {
        return "Emp{" + "stuid=" + stuid + ", stuname='"
        		 + stuname + '\'' ;
    }
    
	public int getStuid() {
		return stuid;
	}
	public void setStuid(int stuid) {
		this.stuid = stuid;
	}
	public String getStuname() {
		return stuname;
	}
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
}
