package model;

import java.util.ArrayList;

public class KeepDuplicates {

    public static ArrayList<Prodotto> KeepDuplicates(ArrayList<Prodotto> prodotti1, ArrayList<Prodotto> prodotti2){
        ArrayList<Integer> prododdi1Id = new ArrayList<>();
        ArrayList<Integer> prododdi2Id = new ArrayList<>();
        ArrayList<Prodotto> prodotti = new ArrayList<>();
        var filter = new ProdottoDAO();
        for(Prodotto x: prodotti1){
            prododdi1Id.add(x.getId());
        }
        for(Prodotto x:prodotti2){
            prododdi2Id.add(x.getId());
        }
        prododdi1Id.retainAll(prododdi2Id);
        for(Integer x:prododdi1Id){
            prodotti.add(filter.doRetriveByID(x));
        }
        return prodotti;
        //prova2
    }
}
