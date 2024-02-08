.class Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;
.super Ljava/lang/Object;
.source "UsbProfileGroupSettingsManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/UsbProfileGroupSettingsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AccessoryFilter"
.end annotation


# instance fields
.field public final mManufacturer:Ljava/lang/String;

.field public final mModel:Ljava/lang/String;

.field public final mVersion:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/hardware/usb/UsbAccessory;)V
    .registers 3

    .prologue
    .line 459
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 460
    invoke-virtual {p1}, Landroid/hardware/usb/UsbAccessory;->getManufacturer()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    .line 461
    invoke-virtual {p1}, Landroid/hardware/usb/UsbAccessory;->getModel()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    .line 462
    invoke-virtual {p1}, Landroid/hardware/usb/UsbAccessory;->getVersion()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    .line 463
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 453
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 454
    iput-object p1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    .line 455
    iput-object p2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    .line 456
    iput-object p3, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    .line 457
    return-void
.end method

.method public static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 471
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v5

    .line 472
    const/4 v0, 0x0

    move v4, v0

    move-object v2, v1

    move-object v3, v1

    move-object v0, v1

    :goto_a
    if-ge v4, v5, :cond_3e

    .line 473
    invoke-interface {p0, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v6

    .line 474
    invoke-interface {p0, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v1

    .line 476
    const-string/jumbo v7, "manufacturer"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_26

    move-object v8, v2

    move-object v2, v1

    move-object v1, v8

    .line 472
    :goto_20
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    move-object v3, v2

    move-object v2, v1

    goto :goto_a

    .line 478
    :cond_26
    const-string/jumbo v7, "model"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_31

    move-object v2, v3

    .line 479
    goto :goto_20

    .line 480
    :cond_31
    const-string/jumbo v7, "version"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_44

    move-object v0, v1

    move-object v1, v2

    move-object v2, v3

    .line 481
    goto :goto_20

    .line 484
    :cond_3e
    new-instance v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    invoke-direct {v1, v3, v2, v0}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_44
    move-object v1, v2

    move-object v2, v3

    goto :goto_20
.end method


# virtual methods
.method public contains(Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;)Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 515
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    if-eqz v0, :cond_12

    iget-object v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_12

    .line 516
    return v2

    .line 518
    :cond_12
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    if-eqz v0, :cond_23

    iget-object v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_23

    return v2

    .line 519
    :cond_23
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    if-eqz v0, :cond_30

    iget-object v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    :goto_2f
    return v0

    :cond_30
    const/4 v0, 0x1

    goto :goto_2f
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 525
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    if-eqz v1, :cond_9

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    if-nez v1, :cond_a

    .line 526
    :cond_9
    return v0

    .line 525
    :cond_a
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    if-eqz v1, :cond_9

    .line 528
    instance-of v1, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    if-eqz v1, :cond_31

    .line 529
    check-cast p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;

    .line 530
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    iget-object v2, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 531
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    iget-object v2, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 530
    if-eqz v1, :cond_30

    .line 532
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 530
    :cond_30
    return v0

    .line 534
    :cond_31
    instance-of v1, p1, Landroid/hardware/usb/UsbAccessory;

    if-eqz v1, :cond_5a

    .line 535
    check-cast p1, Landroid/hardware/usb/UsbAccessory;

    .line 536
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/hardware/usb/UsbAccessory;->getManufacturer()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_59

    .line 537
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/hardware/usb/UsbAccessory;->getModel()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 536
    if-eqz v1, :cond_59

    .line 538
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/hardware/usb/UsbAccessory;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 536
    :cond_59
    return v0

    .line 540
    :cond_5a
    return v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 545
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    if-nez v0, :cond_12

    move v0, v1

    .line 546
    :goto_6
    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    if-nez v2, :cond_19

    move v2, v1

    .line 545
    :goto_b
    xor-int/2addr v0, v2

    .line 547
    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    if-nez v2, :cond_20

    .line 545
    :goto_10
    xor-int/2addr v0, v1

    return v0

    :cond_12
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_6

    .line 546
    :cond_19
    iget-object v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_b

    .line 547
    :cond_20
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_10
.end method

.method public matches(Landroid/hardware/usb/UsbAccessory;)Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 502
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    if-eqz v0, :cond_14

    invoke-virtual {p1}, Landroid/hardware/usb/UsbAccessory;->getManufacturer()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_14

    return v2

    .line 503
    :cond_14
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    if-eqz v0, :cond_27

    invoke-virtual {p1}, Landroid/hardware/usb/UsbAccessory;->getModel()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_27

    return v2

    .line 504
    :cond_27
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    if-eqz v0, :cond_36

    invoke-virtual {p1}, Landroid/hardware/usb/UsbAccessory;->getVersion()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_35
    return v0

    :cond_36
    const/4 v0, 0x1

    goto :goto_35
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 552
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "AccessoryFilter[mManufacturer=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 553
    const-string/jumbo v1, "\", mModel=\""

    .line 552
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 553
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    .line 552
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 554
    const-string/jumbo v1, "\", mVersion=\""

    .line 552
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 554
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    .line 552
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 554
    const-string/jumbo v1, "\"]"

    .line 552
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 488
    const-string/jumbo v0, "usb-accessory"

    invoke-interface {p1, v2, v0}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 489
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    if-eqz v0, :cond_13

    .line 490
    const-string/jumbo v0, "manufacturer"

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mManufacturer:Ljava/lang/String;

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 492
    :cond_13
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    if-eqz v0, :cond_1f

    .line 493
    const-string/jumbo v0, "model"

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mModel:Ljava/lang/String;

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 495
    :cond_1f
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    if-eqz v0, :cond_2b

    .line 496
    const-string/jumbo v0, "version"

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$AccessoryFilter;->mVersion:Ljava/lang/String;

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 498
    :cond_2b
    const-string/jumbo v0, "usb-accessory"

    invoke-interface {p1, v2, v0}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 499
    return-void
.end method
