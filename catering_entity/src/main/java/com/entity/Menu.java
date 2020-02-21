package com.entity;

import lombok.Data;

@Data
public class Menu {
    private String id;
    private String name;
    private String uri;
    private Boolean parent;
    private Integer pid;
}
