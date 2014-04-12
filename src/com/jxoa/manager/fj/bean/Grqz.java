package com.jxoa.manager.fj.bean;



/**
 * Grqz entity. @author MyEclipse Persistence Tools
 */

public class Grqz  implements java.io.Serializable {


    // Fields    

     private String grqzguid;
     private String rkjbguid;
     private String djsj;
     private String qzcs;
     private String qzgw;
     private String xjdy;
     private String xm;
     private String rkjbguid1;
     private String rkjbguid2;
    // Constructors

    /** default constructor */
    public Grqz() {
    }

    
    /** full constructor */
    public Grqz(String rkjbguid, String djsj, String qzcs, String qzgw, String xjdy) {
        this.rkjbguid = rkjbguid;
        this.djsj = djsj;
        this.qzcs = qzcs;
        this.qzgw = qzgw;
        this.xjdy = xjdy;
    }

   
    // Property accessors

    public String getGrqzguid() {
        return this.grqzguid;
    }
    
    public String getRkjbguid2() {
		return rkjbguid2;
	}


	public void setRkjbguid2(String rkjbguid2) {
		this.rkjbguid2 = rkjbguid2;
	}


	public String getRkjbguid1() {
		return rkjbguid1;
	}


	public void setRkjbguid1(String rkjbguid1) {
		this.rkjbguid1 = rkjbguid1;
	}


	public String getXm() {
		return xm;
	}


	public void setXm(String xm) {
		this.xm = xm;
	}


	public void setGrqzguid(String grqzguid) {
        this.grqzguid = grqzguid;
    }

    public String getRkjbguid() {
        return this.rkjbguid;
    }
    
    public void setRkjbguid(String rkjbguid) {
        this.rkjbguid = rkjbguid;
    }

    public String getDjsj() {
        return this.djsj;
    }
    
    public void setDjsj(String djsj) {
        this.djsj = djsj;
    }

    public String getQzcs() {
        return this.qzcs;
    }
    
    public void setQzcs(String qzcs) {
        this.qzcs = qzcs;
    }

    public String getQzgw() {
        return this.qzgw;
    }
    
    public void setQzgw(String qzgw) {
        this.qzgw = qzgw;
    }

    public String getXjdy() {
        return this.xjdy;
    }
    
    public void setXjdy(String xjdy) {
        this.xjdy = xjdy;
    }
   








}