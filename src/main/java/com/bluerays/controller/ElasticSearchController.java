package com.bluerays.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluerays.url.mapper.URLMapper;

@Controller
public class ElasticSearchController {
	
	private HttpURLConnection httpURLConnection;
	private URL url;
	
	@RequestMapping (value="/search" , method=RequestMethod.GET)
	public @ResponseBody String search(){
		try {
			url=new URL(URLMapper.SEARCH_ALL_INDEX_URL);
			httpURLConnection=(HttpURLConnection) url.openConnection();
			httpURLConnection.setRequestMethod("GET");
			httpURLConnection.addRequestProperty("Accept", "application/json");
			
			BufferedReader responseBuffer = new BufferedReader(new InputStreamReader (httpURLConnection.getInputStream()));
            String output;

            System.out.println("Output from Server:  \n");
            String data="{}";
            
            while ((output = responseBuffer.readLine()) != null) {
            	data=output;
            	System.out.println(data);
            }

            httpURLConnection.disconnect();
            return data;

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "{}";
	}
}
