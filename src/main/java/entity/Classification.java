package entity;

public class Classification {
    private int idclassification;
    private String classificationname;
    private String classificationgrade;


    public static String getSecondaryClassificationmapping(String classificationgrade) {
        String secondaryClassificationgrade = "";

        int a = Integer.parseInt(classificationgrade);
        secondaryClassificationgrade = secondaryClassificationgrade + (char) (a + 96);

        return secondaryClassificationgrade;
    }

    public int getIdclassification() {
        return idclassification;
    }

    public void setIdclassification(int idclassification) {
        this.idclassification = idclassification;
    }

    public String getClassificationname() {
        return classificationname;
    }

    public void setClassificationname(String classificationname) {
        this.classificationname = classificationname;
    }

    public String getClassificationgrade() {
        return classificationgrade;
    }

    public void setClassificationgrade(String classificationgrade) {
        this.classificationgrade = classificationgrade;
    }
}
