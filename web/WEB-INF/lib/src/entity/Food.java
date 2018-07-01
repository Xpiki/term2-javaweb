package entity;

public class Food {
    private String foodname;
    private int price;
    private int inventory;
    private String type;
    private String image;
    private String introduct;
    private  String avgeva;
    private String bname;

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getAvgeva() {
        return avgeva;
    }

    public void setAvgeva(String avgeva) {
        this.avgeva = avgeva;
    }

    public String getFoodname() {
        return foodname;
    }

    public void setFoodname(String foodname) {
        this.foodname = foodname;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getIntroduct() {
        return introduct;
    }

    public void setIntroduct(String introduct) {
        this.introduct = introduct;
    }

//    public float getAvgeva() {
//        return avgeva;
//    }
//
//    public void setAvgeva(float avgeva) {
//        this.avgeva = avgeva;
//    }
}
