package com.zzMovies.entity;

public class MovieMsg {
    private int mid;//电影id
    private String mName;//电影名称
    private String date;//上映时间
    private String country;//国家
    private String actor;//演员
    private String introduce;//详情
    private String age;//推荐年龄
    private String bigImg;//大图
    private String smallImg;//小图
    private String video;//播放路径
    private Category category; // 所属分类
    private double mScore;
    private int cid;
    private int count;

    public MovieMsg() {
    }

    @Override
    public String toString() {
        return "MovieMsg{" +
                "mid=" + mid +
                ", mName='" + mName + '\'' +
                ", date='" + date + '\'' +
                ", country='" + country + '\'' +
                ", actor='" + actor + '\'' +
                ", introduce='" + introduce + '\'' +
                ", age='" + age + '\'' +
                ", bigImg='" + bigImg + '\'' +
                ", smallImg='" + smallImg + '\'' +
                ", video='" + video + '\'' +
                ", category=" + category +
                ", mScore=" + mScore +
                ", cid=" + cid +
                ", count=" + count +
                '}';
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getBigImg() {
        return bigImg;
    }

    public void setBigImg(String bigImg) {
        this.bigImg = bigImg;
    }

    public String getSmallImg() {
        return smallImg;
    }

    public void setSmallImg(String smallImg) {
        this.smallImg = smallImg;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public double getmScore() {
        return mScore;
    }

    public void setmScore(double mScore) {
        this.mScore = mScore;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
