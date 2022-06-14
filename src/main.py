#librerie utilizzate da flask
from flask import Flask,render_template,request,jsonify
from marshmallow import Schema,fields
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from datetime import datetime
import pandas                                                            #Libreria lettura .csv
import numpy as np                                                       #Libreria elaborazione variabili e conversione  

#inizializations
app = Flask(__name__)
#inizialize CORS requests
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
#inizialize the database
db = SQLAlchemy(app)
#inizialize db migration tool
migrate=Migrate(app,db)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:root@localhost/Serie_A'

#models_________________________________
class Player(db.Model):
    __tablename__='player'
    id = db.Column(db.Integer, primary_key=True)
    name=db.Column(db.String(30),nullable=False)
    surname=db.Column(db.String(30),nullable=False)
    age=db.Column(db.Integer,nullable=False)
    sopran=db.Column(db.String(30),unique=True)
    naz=db.Column(db.String(10),unique=False)

    def __init__(self,n,s,a):
        self.name=n
        self.surname=s
        self.age=a


class Squad(db.Model):
    __tablename__='squad'
    id = db.Column(db.Integer, primary_key=True)        
    name=db.Column(db.String(30),nullable=False)                    #Nome ufficiale club
    nick=db.Column(db.String(30),nullable=False,unique=True)        #nome breve club
    prov=db.Column(db.String,nullable=True)                         #Sede club
    bornDate=db.Column(db.Integer,nullable=True)                    #anno fondazione club
    Pres=db.Column(db.String(40),nullable=True)
    VicePres=db.Column(db.String(40),nullable=True)
    Stadio=db.Column(db.String(40),nullable=True)

def __init__(self,n,nk,a,p):
    self.name=n
    self.nick=nk
    self.bornDate=a
    self.prov=p

class SquadraSchema(Schema):
    name=fields.String()
    nick=fields.String()

class Contract(db.Model):
    __tablename__='contract'
    id = db.Column(db.Integer, primary_key=True)
    StartDate=db.Column(db.Date,nullable=False)
    EndDate=db.Column(db.Date,nullable=False)
    type=db.Column(db.String(15),nullable=False)
    N_maglia=db.Column(db.Integer,nullable=True)
    ruolo=db.Column(db.String(10),nullable=True)
    id_squad=db.Column(db.Integer,db.ForeignKey('squad.id'),nullable=True)
    id_player=db.Column(db.Integer,db.ForeignKey('player.id'),nullable=True)
    player=db.relationship("Player")
    squad=db.relationship("Squad")

class Category(db.Model):                                               #work in progress
    __tablename__='category'
    id = db.Column(db.Integer, primary_key=True)
    name=db.Column(db.String(10),nullable=False)


class News(db.Model):
    __tablename__='news'
    id = db.Column(db.Integer, primary_key=True)
    category=db.Column(db.String(10),nullable=False)
    title=db.Column(db.String(80),nullable=False)
    content=db.Column(db.String(1400),nullable=True)
    hash1=db.Column(db.String(10),nullable=True)
    hash2=db.Column(db.String(10),nullable=True)
    hash3=db.Column(db.String(10),nullable=True)
    DateW=db.Column(db.Date,nullable=True)
    srcImg=db.Column(db.String(30),nullable=True)

    def __init__(self,ttl,cnt,cat):
        self.title=ttl
        self.content=cnt
        self.category=cat
        self.DateW=datetime.now()                                       #esempio datetime che prende l'orario attuale


class Classifica(db.Model):
    __tablename__='classifica'
    id = db.Column(db.Integer, primary_key=True)
    squadra=db.Column(db.Integer,db.ForeignKey('squad.id'),nullable=False)
    Punti=db.Column(db.Integer,nullable=False)
    Partite_Giocate=db.Column(db.Integer,nullable=False)
    Partite_Vinte=db.Column(db.Integer,nullable=False)
    Partite_Paregg=db.Column(db.Integer,nullable=False)
    Partite_Perse=db.Column(db.Integer,nullable=False)
    Goal_Fatti=db.Column(db.Integer,nullable=False)
    Goal_Subiti=db.Column(db.Integer,nullable=False)
    squad=db.relationship("Squad")

    def __init__(self,Squadra,Punti,G,V,N,P,GF,GS):
        self.squadra=Squadra
        self.Punti=Punti
        self.Partite_Giocate=G
        self.Partite_Paregg=N
        self.Partite_Perse=P
        self.Partite_Vinte=V
        self.Goal_Fatti=GF
        self.Goal_Subiti=GS

class ClassificaSchema(Schema):
        squadra = fields.Nested(SquadraSchema)
        Punti=fields.Number()
        Partite_Giocate=fields.Number()
        Partite_Vinte=fields.Number()
        Partite_Paregg=fields.Number()
        Partite_Perse=fields.Number()
        Goal_Fatti=fields.Number()
        Goal_Subiti=fields.Number()

        
#routes_________________________________
@app.route('/',methods=['GET'])
def welcome():
    col_list = ["POSIZIONE","NOME"]
    df = pandas.read_csv('src/static/csv_input/Lazio.csv',usecols=col_list)
    print(df.loc[0,"NOME"])
    if(df.loc[0,"POSIZIONE"]=="PRESIDENTE"):
        Pres=df.loc[0,"POSIZIONE"]
    Cons=df.loc[1,"NOME"]
    return render_template("index.html")


@app.route('/newsMenu',methods=['GET'])
def news():
    newsL=db.session.query(News).all()
    return render_template("newsMenu.html",List=newsL)


@app.route('/SearchFormPlayer',methods=['GET','POST']) 
def ScPlayer():                                                 #metodo con Form
    if request.method == 'GET':
        return render_template("searchP.html")
    if request.method == 'POST':
        NP=request.form['nameP']
        r=Player.query.filter_by(name=NP).first()
        return render_template("searchP.html",result=r)


@app.route('/squadList',methods=['GET'])
def Sq_List():
    SqListN=db.session.query(Squad).all()
    return render_template('squadList.html',List=SqListN)
    

@app.route('/playerList',methods=['GET'])
def Pl_List():
    PlListN=db.session.query(Player).all()
    return render_template('playerList.html',List=PlListN)


@app.route('/ins/player/',methods=['POST'])                                 #metodo con PostMan
def Ins_player():
    Nm=request.args.get('name')
    Su=request.args.get('surname')
    Ag=request.args.get('age')
    Pla=Player(Nm,Su,Ag)
    db.session.add(Pla)
    db.session.commit()
    return jsonify('Inserimento giocatore corretto: ')

@app.route('/ins/squad/',methods=['POST'])
def Ins_squad():
    Nsq=request.args.get('Sqname')
    Nksq=request.args.get('Sqnk')
    prov=request.args.get('prov')
    YFon=request.args.get('year')
    Sq=Squad(Nsq,Nksq,YFon,prov)
    db.session.add(Sq)
    db.session.commit()
    return jsonify('Inserimento squadra corretto: ')


@app.route('/classifica',methods=['POST','GET'])                            #metodo con inserimento file .csv
def classifica():
    if(request.method=='POST'):
        col_list = ["Pos","Squadra","Punti","G","V","N","P","GF","GS"]
        df = pandas.read_csv('src/static/csv_input/Classifica.csv',usecols=col_list)
        print(df.dtypes)
        for i, row in enumerate(df.values):
            punti=df.loc[i,"Punti"].astype(int)
            Punti=np.int16(punti).item()
            Squadra=df.loc[i,"Squadra"]
            Sqd=db.session.query(Squad.id).filter(Squad.nick==Squadra)
            P=df.loc[i,"P"]
            P=np.int16(P).item()
            V=df.loc[i,"V"]
            V=np.int16(V).item()
            N=df.loc[i,"N"]
            N=np.int16(N).item()
            G=df.loc[i,"G"]
            G=np.int16(G).item()
            GF=df.loc[i,"GF"]
            GF=np.int16(GF).item()
            GS=df.loc[i,"GS"]
            GS=np.int16(GS).item()
            ClassS=Classifica(Sqd,Punti,G,V,N,P,GF,GS)
            db.session.add(ClassS)
            db.session.commit()
            print(Squadra,"    -   ",Punti," - ",G," - ",V," - ",N," - ",P," - ",GF," - ",GS)
        return render_template("index.html")
    if(request.method=='GET'):
        Class=db.session.query(Classifica).all()
        Cl_schema=ClassificaSchema(many=True)
        Squads=Cl_schema.dump(Class)
        return render_template("classifica.html",Classifica=Squads)


@app.route('/Ins/contract/',methods=['POST'])                                       #metodo con PostMan
def Ins_contract():
    Nmsq=request.args.get('nkSq')
    NmPl=request.args.get('namePl')
    SuPl=request.args.get('surnamePl')
    type=request.args.get('type')
    Pla=db.session.query(Player.id).filter(Player.name==NmPl,Player.surname==SuPl)
    Squ=db.session.query(Squad.id).filter(Squad.name==Nmsq)
    DateStart=datetime(2019, 6,10)
    DateEnd=datetime(2019, 6,10)
    Cnt=Contract()
    Cnt.id_player=Pla
    Cnt.id_squad=Squ
    Cnt.StartDate=DateStart
    Cnt.EndDate=DateEnd
    Cnt.type=type
    db.session.add(Cnt)
    db.session.commit()
    return jsonify('Inserimento Contratto con successo ')

@app.route('/squadD/<name>',methods=['GET'])
def squadDetail(name):
    Sq=db.session.query(Squad).filter(Squad.nick==name).first()
    return render_template('squadDetail.html',squad=Sq)

@app.route('/newsD/<idN>',methods=['GET'])
def newsDetail(idN):
    Nw=db.session.query(News).filter(News.id==idN).first()
    print(Nw)
    return render_template('newsPage.html',news=Nw)


@app.route('/Ins/news/',methods=['POST'])                                   #metodo con PostMan
def Ins_news():
    Title=request.args.get("title")
    content=request.args.get("content")
    cat=request.args.get("category")
    DateW=datetime(2019, 6,10)                                              #esempio datetime
    nws=News(Title,content,cat)
    db.session.add(nws)
    db.session.commit()
    return jsonify("inserimento news corretto")


@app.route('/Ins/squad/csv',methods=['GET'])                                   #metodo con PostMan
def Ins_atc():
    df = pandas.read_csv('src/static/csv_input/Atalanta.csv')
    df.head()
    df.to_sql('SquadraA', db)
    return render_template('index.html')