package model;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class TagFilter {

    public static void addTags(String[] tags){
        var filter = new TagDAO();
        ArrayList<Tag> tuttiTag = filter.doRetriveAll();
        for(String x:tags){
            for(Tag y: tuttiTag){

            }
        }
    }
}
