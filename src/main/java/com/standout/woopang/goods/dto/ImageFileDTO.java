package com.standout.woopang.goods.dto;

import lombok.*;

@Setter
@Getter
public class ImageFileDTO {
    private int goods_id;
    private int image_id;
    private String fileName;
    private String fileType;
    private String reg_id;

}
