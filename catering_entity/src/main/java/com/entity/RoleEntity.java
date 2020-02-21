package com.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 挥霍的人生
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class RoleEntity {
    private String id;
    private String name;
    private String description;

}
