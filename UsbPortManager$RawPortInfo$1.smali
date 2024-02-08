.class final Lcom/android/server/usb/UsbPortManager$RawPortInfo$1;
.super Ljava/lang/Object;
.source "UsbPortManager.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/UsbPortManager$RawPortInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/android/server/usb/UsbPortManager$RawPortInfo;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 828
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/android/server/usb/UsbPortManager$RawPortInfo;
    .registers 12

    .prologue
    const/4 v0, 0x1

    const/4 v8, 0x0

    .line 831
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 832
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 833
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 834
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v4

    if-eqz v4, :cond_31

    move v4, v0

    .line 835
    :goto_15
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 836
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v6

    if-eqz v6, :cond_33

    move v6, v0

    .line 837
    :goto_20
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    .line 838
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v9

    if-eqz v9, :cond_2b

    move v8, v0

    .line 839
    :cond_2b
    new-instance v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;

    invoke-direct/range {v0 .. v8}, Lcom/android/server/usb/UsbPortManager$RawPortInfo;-><init>(Ljava/lang/String;IIZIZIZ)V

    return-object v0

    :cond_31
    move v4, v8

    .line 834
    goto :goto_15

    :cond_33
    move v6, v8

    .line 836
    goto :goto_20
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 829
    invoke-virtual {p0, p1}, Lcom/android/server/usb/UsbPortManager$RawPortInfo$1;->createFromParcel(Landroid/os/Parcel;)Lcom/android/server/usb/UsbPortManager$RawPortInfo;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/android/server/usb/UsbPortManager$RawPortInfo;
    .registers 3

    .prologue
    .line 846
    new-array v0, p1, [Lcom/android/server/usb/UsbPortManager$RawPortInfo;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 844
    invoke-virtual {p0, p1}, Lcom/android/server/usb/UsbPortManager$RawPortInfo$1;->newArray(I)[Lcom/android/server/usb/UsbPortManager$RawPortInfo;

    move-result-object v0

    return-object v0
.end method
