package com.entity;

import lombok.Data;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author 挥霍的人生
 */
@Data
@ResponseBody
public class ProductType {
    private Integer tid;
    private String typeName;
}
