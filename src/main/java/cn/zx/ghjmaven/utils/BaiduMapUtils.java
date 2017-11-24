package cn.zx.ghjmaven.utils;	
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;
import net.sf.json.JSONObject;

/** 
 * @author 作者 : 年轻的谷弟
 * @createDate 创建时间：2017年10月10日 下午2:47:07 
 * 类说明--
 */
public class BaiduMapUtils {
	/**
	 * 百度地图通过经纬度来获取地址,传入参数纬度lat、经度lng
	 * @param lat
	 * @param lng
	 * @return
	 */
	public static String getCity(String lat, String lng) {	
		JSONObject obj = getLocationInfo(lat, lng).getJSONObject("result").getJSONObject("addressComponent");
		return obj.getString("city");	
	}	
	public static JSONObject getLocationInfo(String lat, String lng) {
		String url = "http://api.map.baidu.com/geocoder/v2/?location=" + lat + "," + lng + "&output=json&ak=kRHuqFbkaoDcf5CsmOY0fwlpOZZgMxkt" +"&pois=0";
		JSONObject obj = JSONObject.fromObject(HttpUtils.getRequest(url));
		System.out.println(obj);
		return obj;
	}

	/**
	 * 百度地图通过地址来获取经纬度，传入参数address
	 * @param address
	 * @return
	 */
	public static Map<String,Double> getLngAndLat(String address){
        Map<String,Double> map=new HashMap<String, Double>();
        String url = "http://api.map.baidu.com/geocoder/v2/?address="+address+"&output=json&ak=kRHuqFbkaoDcf5CsmOY0fwlpOZZgMxkt";
        String json = loadJSON(url);
        JSONObject obj = JSONObject.fromObject(json);
        if(obj.get("status").toString().equals("0")){
            double lng=obj.getJSONObject("result").getJSONObject("location").getDouble("lng");
            double lat=obj.getJSONObject("result").getJSONObject("location").getDouble("lat");
            map.put("lng", lng);
            map.put("lat", lat);
            System.out.println("经度：" + lng + "--- 纬度：" + lat);
        }else{
            System.out.println("未找到相匹配的经纬度！");
        }
        return map;
    }
    public static String loadJSON (String url) {
        StringBuilder json = new StringBuilder();
        try {
            URL oracle = new URL(url);
            URLConnection yc = oracle.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(
                    yc.getInputStream()));
            String inputLine = null;
            while ( (inputLine = in.readLine()) != null) {
                json.append(inputLine);
            }
            in.close();
        } catch (Exception e) {
        }
        return json.toString();
    }
	
}
