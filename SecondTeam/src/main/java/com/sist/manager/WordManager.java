package com.sist.manager;
import java.util.*;

import org.snu.ids.ha.index.Keyword;
import org.snu.ids.ha.index.KeywordExtractor;
import org.snu.ids.ha.index.KeywordList;
import org.springframework.stereotype.Component;

import com.sist.vo.*;

@Component
public class WordManager {
   
   public List<String> wordListData(String content)
   {
	   List<String> list=new ArrayList<String>();
	   // string to extract keywords
	   String strToExtrtKwrd = content;

	   // init KeywordExtractor
	   KeywordExtractor ke = new KeywordExtractor();

	   // extract keywords
	   KeywordList kl = ke.extractKeyword(strToExtrtKwrd, true);
	   int k=0;
	   // print result
	   for( int i = kl.size()-1; i >=0 ; i--) {
	   	Keyword kwrd = kl.get(i);
	   
	   	if(kwrd.getString().length()>1 && kwrd.getCnt()>1)
	   	{
	   		
	   		
	   		list.add(kwrd.getString());
	   		k++;
	   	}
	   	if(k>20) {
	   		break;
	   	}
	   }
	   return list;
   }
}