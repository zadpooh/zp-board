package com.dn.spring.boardConfig.domain;

import lombok.Data;

@Data
public class BoardConfigMetaData {
    private String listType="list";
    private String layout="board";
    private String skin="";
    private boolean mobileFlag=false;
    private boolean searchFlag=false;
    private boolean commentFlag=false;
    private boolean likedFlag=false;
    private boolean fileFlag=false;
    private int fileSize=0;
    private String createdRole="SUPERVISOR";
    private String updatedRole="SUPERVISOR";
    private String deletedRole="SUPERVISOR";
}
