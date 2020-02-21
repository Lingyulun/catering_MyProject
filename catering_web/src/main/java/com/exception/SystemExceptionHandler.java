package com.exception;

import com.entity.vo.ResponseVO;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @author 挥霍的人生
 */
@ControllerAdvice
public class SystemExceptionHandler {
    @ExceptionHandler(RuntimeException.class)
    public ResponseVO handlerException(){
        ResponseVO responseVO=new ResponseVO();
        responseVO.setCode("500");
        responseVO.setMsg("failed");
        return responseVO;
    }
}
