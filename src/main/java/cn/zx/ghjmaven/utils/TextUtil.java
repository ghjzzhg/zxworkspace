package cn.zx.ghjmaven.utils;

/**
 * Created by ghjzzhg on 2017-12-06.
 */
public class TextUtil {
    public static  boolean isEmpty(String str){
        if(str == null || str.trim().length() == 0) {
            return true ;
        }
        return false ;
    }
}
