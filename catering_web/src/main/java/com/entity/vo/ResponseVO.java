package com.entity.vo;

import lombok.Data;

/**
 * @author 挥霍的人生
 */
@Data
public class ResponseVO {
    private String code;
    private String msg;
    private Object data;

    private ResponseVO(Builder builder) {
       code= builder.code;
       msg=builder.msg;
       data= builder.data;
    }

    public ResponseVO() {
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public static Builder newBuilder(ResponseVO copy) {
        Builder builder = new Builder();
        builder.code = copy.getCode();
        builder.msg = copy.getMsg();
        builder.data = copy.getData();
        return builder;
    }

    public static final class Builder {
        private String code;
        private String msg;
        private Object data;

        private Builder() {
        }

        public Builder code(String val) {
            code = val;
            return this;
        }

        public Builder msg(String val) {
            msg = val;
            return this;
        }

        public Builder data(Object val) {
            data = val;
            return this;
        }

        public ResponseVO build() {
            return new ResponseVO(this);
        }
    }
}
