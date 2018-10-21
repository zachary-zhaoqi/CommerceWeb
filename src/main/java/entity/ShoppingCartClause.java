package entity;

import dao.mall.CommodityDAO;

public class ShoppingCartClause {
    private int idshoppingcartclause;
    private int idmembers;
    private int idcommodity;
    private Commodity commodity;
    private int quantity;

    public int getIdshoppingcartclause() {
        return idshoppingcartclause;
    }

    public void setIdshoppingcartclause(int idshoppingcartclause) {
        this.idshoppingcartclause = idshoppingcartclause;
    }

    public int getIdmembers() {
        return idmembers;
    }

    public void setIdmembers(int idmembers) {
        this.idmembers = idmembers;
    }

    public int getIdcommodity() {
        return idcommodity;
    }

    public void setIdcommodity(int idcommodity) {
        this.idcommodity = idcommodity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public void setCommodity() throws Exception {
        CommodityDAO commodityDAO=new CommodityDAO();
        this.commodity=commodityDAO.getCommodityForID(this.idcommodity);
    }
}
