.class final Lcom/android/server/usb/UsbPortManager$RawPortInfo;
.super Ljava/lang/Object;
.source "UsbPortManager.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/UsbPortManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RawPortInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/usb/UsbPortManager$RawPortInfo$1;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/android/server/usb/UsbPortManager$RawPortInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public canChangeDataRole:Z

.field public canChangeMode:Z

.field public canChangePowerRole:Z

.field public currentDataRole:I

.field public currentMode:I

.field public currentPowerRole:I

.field public final portId:Ljava/lang/String;

.field public final supportedModes:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 828
    new-instance v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo$1;

    invoke-direct {v0}, Lcom/android/server/usb/UsbPortManager$RawPortInfo$1;-><init>()V

    .line 827
    sput-object v0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 781
    return-void
.end method

.method constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .prologue
    .line 791
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 792
    iput-object p1, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->portId:Ljava/lang/String;

    .line 793
    iput p2, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->supportedModes:I

    .line 794
    return-void
.end method

.method constructor <init>(Ljava/lang/String;IIZIZIZ)V
    .registers 9

    .prologue
    .line 796
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 800
    iput-object p1, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->portId:Ljava/lang/String;

    .line 801
    iput p2, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->supportedModes:I

    .line 802
    iput p3, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentMode:I

    .line 803
    iput-boolean p4, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangeMode:Z

    .line 804
    iput p5, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentPowerRole:I

    .line 805
    iput-boolean p6, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangePowerRole:Z

    .line 806
    iput p7, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentDataRole:I

    .line 807
    iput-boolean p8, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangeDataRole:Z

    .line 808
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 812
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 817
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->portId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 818
    iget v0, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->supportedModes:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 819
    iget v0, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentMode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 820
    iget-boolean v0, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangeMode:Z

    if-eqz v0, :cond_36

    move v0, v1

    :goto_16
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 821
    iget v0, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentPowerRole:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 822
    iget-boolean v0, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangePowerRole:Z

    if-eqz v0, :cond_38

    move v0, v1

    :goto_24
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 823
    iget v0, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->currentDataRole:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 824
    iget-boolean v0, p0, Lcom/android/server/usb/UsbPortManager$RawPortInfo;->canChangeDataRole:Z

    if-eqz v0, :cond_3a

    :goto_31
    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 825
    return-void

    :cond_36
    move v0, v2

    .line 820
    goto :goto_16

    :cond_38
    move v0, v2

    .line 822
    goto :goto_24

    :cond_3a
    move v1, v2

    .line 824
    goto :goto_31
.end method
