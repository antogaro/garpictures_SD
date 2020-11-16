package model;

public class Utente {

    public Utente(int id, String nome, String cognome, String nomeUtente, String password, String indirizzo, String provincia, String citta, String telefono, boolean amministratore,String email) {
        this.id = id;
        this.nome = nome;
        this.cognome = cognome;
        this.nomeUtente = nomeUtente;
        this.password = password;
        this.indirizzo = indirizzo;
        this.provincia = provincia;
        this.citta = citta;
        this.telefono = telefono;
        this.amministratore = amministratore;
        this.email = email;
    }

    public Utente() {
        this.visitatore = true;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public void setNomeUtente(String nomeUtente) {
        this.nomeUtente = nomeUtente;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public void setCitta(String citta) {
        this.citta = citta;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setAmministratore(boolean amministratore) {
        this.amministratore = amministratore;
    }

    public void setVisitatore(boolean visitatore){
        this.visitatore = visitatore;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getCognome() {
        return cognome;
    }

    public String getNomeUtente() {
        return nomeUtente;
    }

    public String getPassword() {
        return password;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public String getProvincia() {
        return provincia;
    }

    public String getCitta() {
        return citta;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getEmail() {
        return email;
    }

    public boolean isAmministratore() {
        return amministratore;
    }

    public boolean isVisitatore(){
        return visitatore;
    }


    public void setEmail(String email) {
        this.email = email;
    }

    private int id;
    private String nome;
    private String cognome;
    private String nomeUtente;
    private String password;
    private String indirizzo;
    private String provincia;
    private String citta;
    private String telefono;
    private String email;
    private boolean visitatore;
    private boolean amministratore;
}
