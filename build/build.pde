HColorPool colors;
HDrawablePool pool;

int shapeSize = 40;

void setup(){
    size(1200, 800);
    H.init(this).background(#202020);
    smooth();

    colors = new HColorPool()
        .add(#C3D8D8)
        .add(#819D9E)
        .add(#536266)
    ;

    pool = new HDrawablePool(441);
    pool.autoAddToStage()
        .add(new HShape("vein1.svg"))
        .add(new HShape("vein2.svg"))
        .add(new HShape("vein3.svg"))
        .add(new HShape("vein4.svg"))

        .layout(
            new HGridLayout()
            .startX(0)
            .startY(0)
            .spacing(shapeSize * 1.5, shapeSize)
            .cols(21)
        )

        .onCreate(
            new HCallback() {
                public void run(Object obj) {
                    HShape d = (HShape) obj;
                    d
                        .enableStyle(false)
                        .strokeJoin(ROUND)
                        .strokeCap(ROUND)
                        .strokeWeight(5)
                        .stroke(#2A2B38) 
                        .alpha(200)
                        .fill(colors.getColor())
                        .anchorAt(H.CENTER)
                        .size(shapeSize * 1.5) 
                    ;
                }
            }
        )
        .requestAll()
    ;

    pool = new HDrawablePool(400);
    pool.autoAddToStage()
        .add(new HShape("vein1.svg"))
        .add(new HShape("vein2.svg"))
        .add(new HShape("vein3.svg"))
        .add(new HShape("vein4.svg"))

        .layout(
            new HGridLayout()
            .startX(shapeSize * 0.75)
            .startY(shapeSize * 0.5)
            .spacing(shapeSize * 1.5, shapeSize)
            .cols(20)
        )

        .onCreate(
            new HCallback() {
                public void run(Object obj) {
                    HShape d = (HShape) obj;
                    d
                        .enableStyle(false)
                        .strokeJoin(ROUND)
                        .strokeCap(ROUND)
                        .strokeWeight(5)
                        .stroke(#2A2B38)
                        .alpha(150)
                        .fill(colors.getColor())
                        .anchorAt(H.CENTER)
                        .size(shapeSize * 0.75) 
                    ;
                }
            }
        )
        .requestAll()
    ;

    H.drawStage();

    saveFrame("mechskin.png");
}