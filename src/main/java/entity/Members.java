package entity;

import dao.mall.ShoppingCartClauseDAO;

import java.util.List;

public class Members {
    private int idmembers;
    private String password;
    private String email;
    private List<ShoppingCartClause> shoppingCart;

    public int getIdmembers() {
        return idmembers;
    }

    public void setIdmembers(int idmembers) {
        this.idmembers = idmembers;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<ShoppingCartClause> getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(List<ShoppingCartClause> shoppingCart) {
        this.shoppingCart = shoppingCart;
    }

    public void setShoppingCart() throws Exception {
        ShoppingCartClauseDAO shoppingCartClauseDAO=new ShoppingCartClauseDAO();

        this.shoppingCart = shoppingCartClauseDAO.getShoppingCart(idmembers);
    }
}
