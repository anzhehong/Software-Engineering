package com.camplus.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by fowafolo on 15/5/19.
 */

@Entity
@Table
public class ExchangeOrder {

    @Id
    private String exchangeId;

    private String exchangeUserId;
    private String exchangeClassify;
    private String exchangeDetail;
    private double exchangePrice;
    private String exchangeTitle;

    public String getExchangeId() {
        return exchangeId;
    }

    public void setExchangeId(String exchangeId) {
        this.exchangeId = exchangeId;
    }

    public String getExchangeUserId() {
        return exchangeUserId;
    }

    public void setExchangeUserId(String exchangeUserId) {
        this.exchangeUserId = exchangeUserId;
    }

    public String getExchangeClassify() {
        return exchangeClassify;
    }

    public void setExchangeClassify(String exchangeClassify) {
        this.exchangeClassify = exchangeClassify;
    }

    public String getExchangeDetail() {
        return exchangeDetail;
    }

    public void setExchangeDetail(String exchangeDetail) {
        this.exchangeDetail = exchangeDetail;
    }

    public double getExchangePrice() {
        return exchangePrice;
    }

    public void setExchangePrice(double exchangePrice) {
        this.exchangePrice = exchangePrice;
    }

    public String getExchangeTitle() {
        return exchangeTitle;
    }

    public void setExchangeTitle(String exchangeTitle) {
        this.exchangeTitle = exchangeTitle;
    }
}
