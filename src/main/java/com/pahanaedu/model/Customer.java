package com.pahanaedu.model;

public class Customer {
    private int accountNo;
    private String name;
    private String address;
    private String telephone;
    private int unitsConsumed;

    public Customer() {}

    public Customer(int accountNo, String name, String address, String telephone, int unitsConsumed) {
        this.accountNo = accountNo;
        this.name = name;
        this.address = address;
        this.telephone = telephone;
        this.unitsConsumed = unitsConsumed;
    }

    public int getAccountNo() { return accountNo; }
    public void setAccountNo(int accountNo) { this.accountNo = accountNo; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getTelephone() { return telephone; }
    public void setTelephone(String telephone) { this.telephone = telephone; }
    public int getUnitsConsumed() { return unitsConsumed; }
    public void setUnitsConsumed(int unitsConsumed) { this.unitsConsumed = unitsConsumed; }
}
