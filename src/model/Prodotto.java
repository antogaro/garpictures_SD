package model;

public class Prodotto {
    public Prodotto(String nome, String source, float prezzo, String descrizione){
        this.prezzo= prezzo;
        this.nome = nome;
        this.source = source;
        this.descrizione = descrizione;
    }

    public Prodotto(){

    }

    public String getNome(){
        return nome;
    }

    public String getSource(){
        return source;
    }

    public float getPrezzo(){
        return prezzo;
    }

    public String getDescrizione(){return descrizione;}

    public int getId(){
        return id;
    }

    public void setNome(String nome){
        this.nome = nome;
    }

    public void setPrezzo(float prezzo){
        this.prezzo = prezzo;
    }

    public void setSource(String source){
        this.source = source;
    }

    public void setId(int id){
        this.id = id;
    }

    public void setDescrizione(String descrizione){ this.descrizione = descrizione;}

    public boolean equals(Prodotto prodotto){
        if(prodotto.getId()==this.getId())
             return true;
        else return false;
    }



    private String descrizione;
    private String nome;
    private String source;
    private int id;
    private float prezzo;

}
