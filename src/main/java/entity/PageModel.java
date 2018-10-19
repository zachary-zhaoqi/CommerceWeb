package entity;

import java.util.List;

public class PageModel {
    public static int PAGEMODELSIZE=5;
    private int ResultSize;
    private int CurrentPage;
    private List list;

    public int getResultSize() {
        return ResultSize;
    }

    public void setResultSize(int resultSize) {
        ResultSize = resultSize;
    }


    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getCurrentPage() {
        return CurrentPage;
    }

    public void setCurrentPage(int currentPage) {
        CurrentPage = currentPage;
    }
}
