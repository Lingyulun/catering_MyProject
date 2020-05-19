package com.entity;

import lombok.Data;

/**
 * @author 挥霍的人生
 */
@Data
public class Message {
    private String code;
    private String message;
    private Object object;
    public Message(String code, String message,Object object) {
        this.code=code;
        this.message=message;
        this.object=object;
    }
}
