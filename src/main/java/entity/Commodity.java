package entity;

public class Commodity {

    private int idcommodity;
    private String primaryclassification;
    private String secondaryclassification;
    private String commodityname;
    private String commoditydetail;
    private String commoditynsrc;
    private double commodityprice;
    private String attribute1;
    private String attribute2;
    private boolean putaway;

    public int getIdcommodity() {
        return idcommodity;
    }

    public void setIdcommodity(int idcommodity) {
        this.idcommodity = idcommodity;
    }

    public String getPrimaryclassification() {
        return primaryclassification;
    }

    public void setPrimaryclassification(String primaryclassification) {
        this.primaryclassification = primaryclassification;
    }

    public String getSecondaryclassification() {
        return secondaryclassification;
    }

    public void setSecondaryclassification(String secondaryclassification) {
        this.secondaryclassification = secondaryclassification;
    }

    public String getCommodityname() {
        return commodityname;
    }

    public void setCommodityname(String commodityname) {
        this.commodityname = commodityname;
    }

    public String getCommoditydetail() {
        return commoditydetail;
    }

    public void setCommoditydetail(String commoditydetail) {
        this.commoditydetail = commoditydetail;
    }

    public String getCommoditynsrc() {
        return commoditynsrc;
    }

    public void setCommoditynsrc(String commoditynsrc) {
        this.commoditynsrc = commoditynsrc;
    }

    public double getCommodityprice() {
        return commodityprice;
    }

    public void setCommodityprice(double commodityprice) {
        this.commodityprice = commodityprice;
    }

    public String getAttribute1() {
        return attribute1;
    }

    public void setAttribute1(String attribute1) {
        this.attribute1 = attribute1;
    }

    public String getAttribute2() {
        return attribute2;
    }

    public void setAttribute2(String attribute2) {
        this.attribute2 = attribute2;
    }

    public boolean isPutaway() {
        return putaway;
    }

    public void setPutaway(boolean putaway) {
        this.putaway = putaway;
    }
}
