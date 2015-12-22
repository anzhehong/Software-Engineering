package com.camplus.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by fowafolo on 15/5/19.
 */

@Entity
@Table
public class ExchangeImage {

    @Id
    private String exchangeImageId;

    private String exchangeOrderId;

    public String getExchangeImageId() {
        return exchangeImageId;
    }

    public void setExchangeImageId(String exchangeImageId) {
        this.exchangeImageId = exchangeImageId;
    }

    public String getExchangeOrderId() {
        return exchangeOrderId;
    }

    public void setExchangeOrderId(String exchangeOrderId) {
        this.exchangeOrderId = exchangeOrderId;
    }
}
