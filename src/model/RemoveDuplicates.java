package model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class RemoveDuplicates {

    public static ArrayList<String> RemoveDuplicates(List<String> tags){
        ArrayList<String> tags2 = new ArrayList<>();
        for(String x:tags){
            tags2.add(x);
        }
        Set<String> set = new HashSet<>(tags2);
        tags2.clear();
        tags2.addAll(set);
        return tags2;
    }

    public static ArrayList<Tag> tagFy(ArrayList<String> tagString){
        var filter = new TagDAO();
        ArrayList<Tag> tags = new ArrayList<>();
        for(String x:tagString){
            if(filter.doRetriveByID(x)!=null)
                tags.add(filter.doRetriveByID(x));
            else{
                filter.doSave(new Tag(x));
                tags.add(new Tag(x));
            }
        }
        return tags;
    }
}
