.class Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;
.super Ljava/lang/Object;
.source "UsbProfileGroupSettingsManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/UsbProfileGroupSettingsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DeviceFilter"
.end annotation


# instance fields
.field public final mClass:I

.field public final mManufacturerName:Ljava/lang/String;

.field public final mProductId:I

.field public final mProductName:Ljava/lang/String;

.field public final mProtocol:I

.field public final mSerialNumber:Ljava/lang/String;

.field public final mSubclass:I

.field public final mVendorId:I


# direct methods
.method public constructor <init>(IIIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    .prologue
    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 184
    iput p1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    .line 185
    iput p2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    .line 186
    iput p3, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mClass:I

    .line 187
    iput p4, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSubclass:I

    .line 188
    iput p5, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProtocol:I

    .line 189
    iput-object p6, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    .line 190
    iput-object p7, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    .line 191
    iput-object p8, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    .line 192
    return-void
.end method

.method public constructor <init>(Landroid/hardware/usb/UsbDevice;)V
    .registers 3

    .prologue
    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 195
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getVendorId()I

    move-result v0

    iput v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    .line 196
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getProductId()I

    move-result v0

    iput v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    .line 197
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceClass()I

    move-result v0

    iput v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mClass:I

    .line 198
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceSubclass()I

    move-result v0

    iput v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSubclass:I

    .line 199
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceProtocol()I

    move-result v0

    iput v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProtocol:I

    .line 200
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getManufacturerName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    .line 201
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getProductName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    .line 202
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    .line 203
    return-void
.end method

.method private matches(III)Z
    .registers 8

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v3, -0x1

    .line 290
    iget v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mClass:I

    if-eq v2, v3, :cond_b

    iget v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mClass:I

    if-ne p1, v2, :cond_1e

    .line 291
    :cond_b
    iget v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSubclass:I

    if-eq v2, v3, :cond_13

    iget v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSubclass:I

    if-ne p2, v2, :cond_1e

    .line 292
    :cond_13
    iget v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProtocol:I

    if-eq v2, v3, :cond_1b

    iget v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProtocol:I

    if-ne p3, v2, :cond_1c

    .line 290
    :cond_1b
    :goto_1b
    return v0

    :cond_1c
    move v0, v1

    .line 292
    goto :goto_1b

    :cond_1e
    move v0, v1

    .line 290
    goto :goto_1b
.end method

.method public static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;
    .registers 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    const/4 v2, -0x1

    .line 208
    const/4 v3, -0x1

    .line 209
    const/4 v4, -0x1

    .line 210
    const/4 v5, -0x1

    .line 211
    const/4 v6, -0x1

    .line 212
    const/4 v7, 0x0

    .line 213
    const/4 v8, 0x0

    .line 214
    const/4 v9, 0x0

    .line 216
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v12

    .line 217
    const/4 v1, 0x0

    move v11, v1

    :goto_e
    if-ge v11, v12, :cond_d4

    .line 218
    move-object/from16 v0, p0

    invoke-interface {v0, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v13

    .line 219
    move-object/from16 v0, p0

    invoke-interface {v0, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v1

    .line 221
    const-string/jumbo v10, "manufacturer-name"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2a

    move-object v7, v1

    .line 217
    :cond_26
    :goto_26
    add-int/lit8 v1, v11, 0x1

    move v11, v1

    goto :goto_e

    .line 223
    :cond_2a
    const-string/jumbo v10, "product-name"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_35

    move-object v8, v1

    .line 224
    goto :goto_26

    .line 225
    :cond_35
    const-string/jumbo v10, "serial-number"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_40

    move-object v9, v1

    .line 226
    goto :goto_26

    .line 229
    :cond_40
    const/16 v10, 0xa

    .line 230
    if-eqz v1, :cond_81

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v14

    const/4 v15, 0x2

    if-le v14, v15, :cond_81

    const/4 v14, 0x0

    invoke-virtual {v1, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    const/16 v15, 0x30

    if-ne v14, v15, :cond_81

    .line 231
    const/4 v14, 0x1

    invoke-virtual {v1, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    const/16 v15, 0x78

    if-eq v14, v15, :cond_66

    const/4 v14, 0x1

    invoke-virtual {v1, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    const/16 v15, 0x58

    if-ne v14, v15, :cond_81

    .line 233
    :cond_66
    const/16 v10, 0x10

    .line 234
    const/4 v14, 0x2

    invoke-virtual {v1, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    move/from16 v16, v10

    move-object v10, v1

    move/from16 v1, v16

    .line 237
    :goto_72
    :try_start_72
    invoke-static {v10, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_75
    .catch Ljava/lang/NumberFormatException; {:try_start_72 .. :try_end_75} :catch_87

    move-result v1

    .line 242
    const-string/jumbo v10, "vendor-id"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_a4

    move v2, v1

    .line 243
    goto :goto_26

    :cond_81
    move/from16 v16, v10

    move-object v10, v1

    move/from16 v1, v16

    .line 231
    goto :goto_72

    .line 238
    :catch_87
    move-exception v1

    .line 239
    invoke-static {}, Lcom/android/server/usb/UsbProfileGroupSettingsManager;->-get0()Ljava/lang/String;

    move-result-object v10

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "invalid number for field "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v10, v13, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_26

    .line 244
    :cond_a4
    const-string/jumbo v10, "product-id"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b0

    move v3, v1

    .line 245
    goto/16 :goto_26

    .line 246
    :cond_b0
    const-string/jumbo v10, "class"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_bc

    move v4, v1

    .line 247
    goto/16 :goto_26

    .line 248
    :cond_bc
    const-string/jumbo v10, "subclass"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_c8

    move v5, v1

    .line 249
    goto/16 :goto_26

    .line 250
    :cond_c8
    const-string/jumbo v10, "protocol"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_26

    move v6, v1

    .line 251
    goto/16 :goto_26

    .line 255
    :cond_d4
    new-instance v1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    invoke-direct/range {v1 .. v9}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;-><init>(IIIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public contains(Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;)Z
    .registers 6

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 333
    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    if-eq v0, v3, :cond_d

    iget v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    if-eq v0, v1, :cond_d

    return v2

    .line 334
    :cond_d
    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    if-eq v0, v3, :cond_18

    iget v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    if-eq v0, v1, :cond_18

    return v2

    .line 335
    :cond_18
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    .line 336
    iget-object v1, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    .line 335
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_29

    .line 337
    return v2

    .line 339
    :cond_29
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_3a

    .line 340
    return v2

    .line 342
    :cond_3a
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    if-eqz v0, :cond_4b

    .line 343
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 342
    if-eqz v0, :cond_4b

    .line 344
    return v2

    .line 348
    :cond_4b
    iget v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mClass:I

    iget v1, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSubclass:I

    iget v2, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProtocol:I

    invoke-direct {p0, v0, v1, v2}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->matches(III)Z

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .prologue
    const/4 v3, 0x1

    const/4 v1, -0x1

    const/4 v2, 0x0

    .line 354
    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    if-eq v0, v1, :cond_b

    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    if-ne v0, v1, :cond_c

    .line 356
    :cond_b
    return v2

    .line 355
    :cond_c
    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mClass:I

    if-eq v0, v1, :cond_b

    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSubclass:I

    if-eq v0, v1, :cond_b

    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProtocol:I

    if-eq v0, v1, :cond_b

    .line 358
    instance-of v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    if-eqz v0, :cond_ac

    .line 359
    check-cast p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;

    .line 361
    iget v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    if-ne v0, v1, :cond_2a

    .line 362
    iget v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    if-eq v0, v1, :cond_2b

    .line 366
    :cond_2a
    return v2

    .line 363
    :cond_2b
    iget v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mClass:I

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mClass:I

    if-ne v0, v1, :cond_2a

    .line 364
    iget v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSubclass:I

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSubclass:I

    if-ne v0, v1, :cond_2a

    .line 365
    iget v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProtocol:I

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProtocol:I

    if-ne v0, v1, :cond_2a

    .line 368
    iget-object v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    if-eqz v0, :cond_46

    .line 369
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    if-nez v0, :cond_46

    .line 380
    :cond_45
    return v2

    .line 370
    :cond_46
    iget-object v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    if-nez v0, :cond_4e

    .line 371
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    if-nez v0, :cond_45

    .line 372
    :cond_4e
    iget-object v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    if-eqz v0, :cond_56

    .line 373
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    if-eqz v0, :cond_45

    .line 374
    :cond_56
    iget-object v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    if-nez v0, :cond_5e

    .line 375
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    if-nez v0, :cond_45

    .line 376
    :cond_5e
    iget-object v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    if-eqz v0, :cond_66

    .line 377
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    if-eqz v0, :cond_45

    .line 378
    :cond_66
    iget-object v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    if-nez v0, :cond_6e

    .line 379
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    if-nez v0, :cond_45

    .line 382
    :cond_6e
    iget-object v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    if-eqz v0, :cond_82

    .line 383
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    if-eqz v0, :cond_82

    .line 384
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 382
    if-nez v0, :cond_aa

    .line 385
    :cond_82
    iget-object v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    if-eqz v0, :cond_96

    .line 386
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    if-eqz v0, :cond_96

    .line 387
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 382
    if-nez v0, :cond_aa

    .line 388
    :cond_96
    iget-object v0, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    if-eqz v0, :cond_ab

    .line 389
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    if-eqz v0, :cond_ab

    .line 390
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 382
    if-eqz v0, :cond_ab

    .line 391
    :cond_aa
    return v2

    .line 393
    :cond_ab
    return v3

    .line 395
    :cond_ac
    instance-of v0, p1, Landroid/hardware/usb/UsbDevice;

    if-eqz v0, :cond_156

    .line 396
    check-cast p1, Landroid/hardware/usb/UsbDevice;

    .line 397
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getVendorId()I

    move-result v0

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    if-ne v0, v1, :cond_c2

    .line 398
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getProductId()I

    move-result v0

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    if-eq v0, v1, :cond_c3

    .line 402
    :cond_c2
    return v2

    .line 399
    :cond_c3
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceClass()I

    move-result v0

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mClass:I

    if-ne v0, v1, :cond_c2

    .line 400
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceSubclass()I

    move-result v0

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSubclass:I

    if-ne v0, v1, :cond_c2

    .line 401
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceProtocol()I

    move-result v0

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProtocol:I

    if-ne v0, v1, :cond_c2

    .line 404
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    if-eqz v0, :cond_e6

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getManufacturerName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_e6

    .line 410
    :cond_e5
    return v2

    .line 405
    :cond_e6
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    if-nez v0, :cond_f0

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getManufacturerName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_e5

    .line 406
    :cond_f0
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    if-eqz v0, :cond_fa

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getProductName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_e5

    .line 407
    :cond_fa
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    if-nez v0, :cond_104

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getProductName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_e5

    .line 408
    :cond_104
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    if-eqz v0, :cond_10e

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_e5

    .line 409
    :cond_10e
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    if-nez v0, :cond_118

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_e5

    .line 412
    :cond_118
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getManufacturerName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_12c

    .line 413
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getManufacturerName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 412
    if-nez v0, :cond_154

    .line 414
    :cond_12c
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getProductName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_140

    .line 415
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getProductName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 412
    if-nez v0, :cond_154

    .line 416
    :cond_140
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_155

    .line 417
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 412
    if-eqz v0, :cond_155

    .line 418
    :cond_154
    return v2

    .line 420
    :cond_155
    return v3

    .line 422
    :cond_156
    return v2
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 427
    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    shl-int/lit8 v0, v0, 0x10

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    or-int/2addr v0, v1

    .line 428
    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mClass:I

    shl-int/lit8 v1, v1, 0x10

    iget v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSubclass:I

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    iget v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProtocol:I

    or-int/2addr v1, v2

    .line 427
    xor-int/2addr v0, v1

    return v0
.end method

.method public matches(Landroid/hardware/usb/UsbDevice;)Z
    .registers 9

    .prologue
    const/4 v6, 0x1

    const/4 v3, -0x1

    const/4 v1, 0x0

    .line 296
    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    if-eq v0, v3, :cond_10

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getVendorId()I

    move-result v0

    iget v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    if-eq v0, v2, :cond_10

    return v1

    .line 297
    :cond_10
    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    if-eq v0, v3, :cond_1d

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getProductId()I

    move-result v0

    iget v2, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    if-eq v0, v2, :cond_1d

    return v1

    .line 298
    :cond_1d
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    if-eqz v0, :cond_28

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getManufacturerName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_28

    return v1

    .line 299
    :cond_28
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    if-eqz v0, :cond_33

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getProductName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_33

    return v1

    .line 300
    :cond_33
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    if-eqz v0, :cond_3e

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3e

    return v1

    .line 301
    :cond_3e
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    if-eqz v0, :cond_57

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getManufacturerName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_57

    .line 302
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getManufacturerName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 301
    if-eqz v0, :cond_57

    .line 302
    return v1

    .line 303
    :cond_57
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    if-eqz v0, :cond_70

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getProductName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_70

    .line 304
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getProductName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 303
    if-eqz v0, :cond_70

    .line 304
    return v1

    .line 305
    :cond_70
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    if-eqz v0, :cond_89

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_89

    .line 306
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 305
    if-eqz v0, :cond_89

    .line 306
    return v1

    .line 309
    :cond_89
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceClass()I

    move-result v0

    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceSubclass()I

    move-result v2

    .line 310
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceProtocol()I

    move-result v3

    .line 309
    invoke-direct {p0, v0, v2, v3}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->matches(III)Z

    move-result v0

    if-eqz v0, :cond_9c

    .line 310
    return v6

    .line 313
    :cond_9c
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getInterfaceCount()I

    move-result v2

    move v0, v1

    .line 314
    :goto_a1
    if-ge v0, v2, :cond_bd

    .line 315
    invoke-virtual {p1, v0}, Landroid/hardware/usb/UsbDevice;->getInterface(I)Landroid/hardware/usb/UsbInterface;

    move-result-object v3

    .line 316
    invoke-virtual {v3}, Landroid/hardware/usb/UsbInterface;->getInterfaceClass()I

    move-result v4

    invoke-virtual {v3}, Landroid/hardware/usb/UsbInterface;->getInterfaceSubclass()I

    move-result v5

    .line 317
    invoke-virtual {v3}, Landroid/hardware/usb/UsbInterface;->getInterfaceProtocol()I

    move-result v3

    .line 316
    invoke-direct {p0, v4, v5, v3}, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->matches(III)Z

    move-result v3

    if-eqz v3, :cond_ba

    .line 317
    return v6

    .line 314
    :cond_ba
    add-int/lit8 v0, v0, 0x1

    goto :goto_a1

    .line 320
    :cond_bd
    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 433
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "DeviceFilter[mVendorId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ",mProductId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 434
    const-string/jumbo v1, ",mClass="

    .line 433
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 434
    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mClass:I

    .line 433
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 434
    const-string/jumbo v1, ",mSubclass="

    .line 433
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 434
    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSubclass:I

    .line 433
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 435
    const-string/jumbo v1, ",mProtocol="

    .line 433
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 435
    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProtocol:I

    .line 433
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 435
    const-string/jumbo v1, ",mManufacturerName="

    .line 433
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 435
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    .line 433
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 436
    const-string/jumbo v1, ",mProductName="

    .line 433
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 436
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    .line 433
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 436
    const-string/jumbo v1, ",mSerialNumber="

    .line 433
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 436
    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    .line 433
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 437
    const-string/jumbo v1, "]"

    .line 433
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 261
    const-string/jumbo v0, "usb-device"

    invoke-interface {p1, v2, v0}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 262
    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    if-eq v0, v3, :cond_18

    .line 263
    const-string/jumbo v0, "vendor-id"

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mVendorId:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 265
    :cond_18
    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    if-eq v0, v3, :cond_28

    .line 266
    const-string/jumbo v0, "product-id"

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductId:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 268
    :cond_28
    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mClass:I

    if-eq v0, v3, :cond_38

    .line 269
    const-string/jumbo v0, "class"

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mClass:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 271
    :cond_38
    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSubclass:I

    if-eq v0, v3, :cond_48

    .line 272
    const-string/jumbo v0, "subclass"

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSubclass:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 274
    :cond_48
    iget v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProtocol:I

    if-eq v0, v3, :cond_58

    .line 275
    const-string/jumbo v0, "protocol"

    iget v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProtocol:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 277
    :cond_58
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    if-eqz v0, :cond_64

    .line 278
    const-string/jumbo v0, "manufacturer-name"

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mManufacturerName:Ljava/lang/String;

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 280
    :cond_64
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    if-eqz v0, :cond_70

    .line 281
    const-string/jumbo v0, "product-name"

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mProductName:Ljava/lang/String;

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 283
    :cond_70
    iget-object v0, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    if-eqz v0, :cond_7c

    .line 284
    const-string/jumbo v0, "serial-number"

    iget-object v1, p0, Lcom/android/server/usb/UsbProfileGroupSettingsManager$DeviceFilter;->mSerialNumber:Ljava/lang/String;

    invoke-interface {p1, v2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 286
    :cond_7c
    const-string/jumbo v0, "usb-device"

    invoke-interface {p1, v2, v0}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 287
    return-void
.end method
