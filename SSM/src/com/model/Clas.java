package com.model;

public class Clas {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column clas.id
     *
     * @mbggenerated Sat Oct 28 14:26:24 CST 2017
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column clas.clasname
     *
     * @mbggenerated Sat Oct 28 14:26:24 CST 2017
     */
    private String clasname;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column clas.num
     *
     * @mbggenerated Sat Oct 28 14:26:24 CST 2017
     */
    private Integer num;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column clas.id
     *
     * @return the value of clas.id
     *
     * @mbggenerated Sat Oct 28 14:26:24 CST 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column clas.id
     *
     * @param id the value for clas.id
     *
     * @mbggenerated Sat Oct 28 14:26:24 CST 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column clas.clasname
     *
     * @return the value of clas.clasname
     *
     * @mbggenerated Sat Oct 28 14:26:24 CST 2017
     */
    public String getClasname() {
        return clasname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column clas.clasname
     *
     * @param clasname the value for clas.clasname
     *
     * @mbggenerated Sat Oct 28 14:26:24 CST 2017
     */
    public void setClasname(String clasname) {
        this.clasname = clasname == null ? null : clasname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column clas.num
     *
     * @return the value of clas.num
     *
     * @mbggenerated Sat Oct 28 14:26:24 CST 2017
     */
    public Integer getNum() {
        return num;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column clas.num
     *
     * @param num the value for clas.num
     *
     * @mbggenerated Sat Oct 28 14:26:24 CST 2017
     */
    public void setNum(Integer num) {
        this.num = num;
    }
}