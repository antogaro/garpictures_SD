package model;


import java.util.ArrayList;

public class Carrello {

    public Carrello(int id) {
        this.carrelloProdotti = new ArrayList<Prodotto>();
        var filter = new CarrelloDAO();
        this.carrelloProdotti = filter.doRetriveByIDUtente(id);
        this.setTotale();
    }

    public Carrello(){
        this.carrelloProdotti = new ArrayList<Prodotto>();
        this.setTotale();
    }



    public boolean isProdottoIn(Prodotto prodotto){
        for(Prodotto p:carrelloProdotti){
            if (p.getId() == prodotto.getId()) return true;
        }
        this.setTotale();
        return false;

    }

    public void addProdotto(Prodotto prodotto,Utente utente){
      var filter = new CarrelloDAO();
      filter.doSave(utente,prodotto);
      carrelloProdotti.add(prodotto);
        this.setTotale();
    }

    public void addProdotto(Prodotto prodotto){
        carrelloProdotti.add(prodotto);
        this.setTotale();
    }

    public void deleteProdotto(Utente utente, Prodotto prodotto){
        var filter = new CarrelloDAO();
        filter.doDelete(utente,prodotto);
        carrelloProdotti = filter.doRetriveByIDUtente(utente.getId());
        this.setTotale();
    }

    public void deleteProdotto(Prodotto prodotto){
       var filter = new CarrelloDAO();
       filter.doDelete(prodotto);
       int i = 0;
       for(Prodotto x: carrelloProdotti){
           if(x.getId() == prodotto.getId()){
               break;
           }
           i++;
       }
       carrelloProdotti.remove(i);
        this.setTotale();
    }

    public void clearCarrello(Utente utente){
        var filter = new CarrelloDAO();
        for(Prodotto x: carrelloProdotti){
            filter.doDelete(utente,x);
        }
        carrelloProdotti.removeAll(carrelloProdotti);
    }

    public void clearCarrello(){
        carrelloProdotti.removeAll(carrelloProdotti);
    }

    public ArrayList<Prodotto> getCarrelloProdotti(){
        return carrelloProdotti;
    }

    private void setTotale(){
        float totale_effettivo = 0;
        for(Prodotto x: carrelloProdotti){
            totale_effettivo += x.getPrezzo();
        }
        System.out.println(totale_effettivo);
        totale=totale_effettivo;
    }

    public boolean isEmpty(){
         return carrelloProdotti.isEmpty();
    }

    public float getTotale() {
        System.out.println(totale);

        return totale;
    }

    private ArrayList<Prodotto> carrelloProdotti;
    private float totale;
}
